class DocumentsController < ApplicationController
  before_action :set_document, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :authenticate_user!

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user

    respond_to do |format|
      if @document.save
        format.html { redirect_to document_url(@document) }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to document_url(@document) }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.html { redirect_to documents_url, notice: "Document was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # gemのOCR
  # def execute_ocr
  #   @document = Document.find(params[:document_id])
  #   # ローカル保存用
  #   image_url = "#{Rails.root}/public#{@document.document_image.url}"

  #   # S3の場合はそそままのURL
  #   # image_url = @document.document_image.url
  #   image = RTesseract.new(image_url, lang: params[:language])
  #   @text = image.to_s.gsub(/(\r\n|\r|\n)/, '\\n')
  #   @text = 'テキストが検出できませんでした' if @text.blank?
  # end

  #AIのOCR S3の場合
  # def execute_vision_api
  #   @document = Document.find(params[:document_id])
  #   image = @document.document_image.url(query: { 'response-content-disposition' => 'attachment' })
  #   image_annotator_client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
  #   response = image_annotator_client.document_text_detection(
  #     image: image, max_results: 1, image_context: { language_hints: %i[ja en] }
  #   )
  #   @vision_text = ''
  #   response.responses.each do |res|
  #     @vision_text << res.text_annotations[0].description.gsub(/(\r\n|\r|\n)/, '\\n')
  #   end
  # end

  #AIのOCR ローカル画像の場合
  def execute_vision_api
    @document = Document.find(params[:document_id])
    image_url = "#{Rails.root}/public#{@document.document_image.url}"
    image_annotator_client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
    response = image_annotator_client.document_text_detection(
      image: image_url, max_results: 1, image_context: { language_hints: %i[ja en] }
    )
    @vision_text = ''
    response.responses.each do |res|
      @vision_text << res.text_annotations[0].description.gsub(/(\r\n|\r|\n)/, '\\n')
    end
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:title, :description, :document_image)
    end
end
