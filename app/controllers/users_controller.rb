class UsersController < ApplicationController

    before_action :authenticate_user!

    # Shows User's profile
    def show
        
    end

    # Display edit form for profile and account settings
    def edit

    end

    # Commit profile/account settings edit to the database
    def update

    end

    # The dashboard serves as a main hub for accessing site features
    def dashboard

    end

    # Logs the user out and deletes their information from the database
    # unless they are currently renting or leasing a property
    def destroy

    end
end
