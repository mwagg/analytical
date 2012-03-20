module Analytical
  module Modules
    class Inform
      include Analytical::Modules::Base

      def initialize(options={})
        super
        @tracking_command_location = :head_append
      end
      
      def init_javascript(location)
        init_location(location) do
          js = <<-HTML
          <!-- Analytical Init: InForm -->
          <script type="text/javascript">
            window._inform = window._inform || {};
            window._inform['_setAccount'] = '#{options[:key]}';

            (function(){
              inscript = document.createElement('script');
              inscript.type = 'text/javascript';
              inscript.async = true;
            
              inscript.src = location.protocol + '//inform.forwardtechnology.co.uk/javascripts/capture.js';
              s = document.getElementsByTagName('script')[0];
              s.parentNode.appendChild(inscript)
            })();
          </script>
          HTML
          js
        end
      end
    end
  end
end
