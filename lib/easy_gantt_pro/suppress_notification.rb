module EasyGanttPro
  module SuppressNotification

    def self.prepended(base)
      base.prepend(InstanceMethods)
    end

    module InstanceMethods

      def notify?
        if RequestStore.store[:easy_gantt_suppress_notification] == true
          false
        else
          super
        end
      end

    end

  end
end

Issue.prepend EasyGanttPro::SuppressNotification
Journal.prepend EasyGanttPro::SuppressNotification

