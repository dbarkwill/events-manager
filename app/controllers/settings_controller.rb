class SettingsController < ApplicationController
    def create
        setting_params.keys.each do |key|
            next if setting_params[key].nil?

            setting = Setting.new(var: key)
            setting.value = setting_params[key].strip
            unless setting.valid?
            end
        end

        setting_params.keys.each do |key|
            Setting.send("#{key}=", setting_params[key].strip) unless setting_params[key].nil?
        end

        redirect_to admin_path, notice: "Setting was successfully updated."   
    end
    
    private
        def setting_params
            params.require(:setting).permit(:purchased_meal_count,:instance_name,:event_name)
        end
end