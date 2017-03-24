class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'You have successfully requested an invite to Socialite.' }
      else
        format.html { render :index, error: 'Failed to request invite.' }
      end 
      
  end 
    
  end


  
  private
    def contact_params
      params.require(:contact).permit(:name, :email)
    end
end
