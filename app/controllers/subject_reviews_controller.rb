class SubjectReviewsController < ApplicationController
  before_action :set_subject_review, only: %i[ show edit update destroy ]
  before_action :check_login, only: [:new, :create, :edit, :update, :destroy]

  # GET /subject_reviews or /subject_reviews.json
  def index
    @subject_reviews = SubjectReview.all
  end

  # GET /subject_reviews/1 or /subject_reviews/1.json
  def show
  end

  # GET /subject_reviews/new
  def new
    @subject_review = SubjectReview.new
  end

  # GET /subject_reviews/1/edit
  def edit
  end

  # POST /subject_reviews or /subject_reviews.json
  def create
    @subject_review = SubjectReview.new(subject_review_params)
    @subject_review.user_id = current_user.id

    respond_to do |format|
      if @subject_review.save
        # format.html { redirect_to @subject_review, notice: "Subject review was successfully created." }
        url = "/subjects/" + @subject_review.subject_id.to_s
        format.html { redirect_to url, notice: 'Subject review was successfully created.' }
        format.json { render :show, status: :created, location: @subject_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_reviews/1 or /subject_reviews/1.json
  def update
    respond_to do |format|
      if @subject_review.update(subject_review_params)
        format.html { redirect_to @subject_review, notice: "Subject review was successfully updated." }
        format.json { render :show, status: :ok, location: @subject_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_reviews/1 or /subject_reviews/1.json
  def destroy
    @subject_review.destroy
    respond_to do |format|
      format.html { redirect_to subject_reviews_url, notice: "Subject review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_review
      @subject_review = SubjectReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_review_params
      params.require(:subject_review).permit(:user_id, :subject_id, :review)
    end
    
    def check_login
      if current_user.nil?
        redirect_to new_user_session_path, error: "Please log in first!"
      end
    end
end
