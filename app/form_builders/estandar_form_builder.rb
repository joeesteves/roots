class EstandarFormBuilder < ActionView::Helpers::FormBuilder
	delegate  :content_tag, to: :@template
	%w[text_field 
		text_area 
		password_field 
		collection_select 
		grouped_collection_select].each do |method_name|

		define_method(method_name) do |nombre,*args|	
			options = args.extract_options!
			if options[:label]
				label = options[:label]
			else
				label = nombre
			end

			"<span class='prefix postfix'>#{label.to_s.capitalize}</span>".html_safe + 
			super(nombre,*args)
		
		end

		def submit

			super("Guardar", :class => 'button tiny boton_largo')

		end
		

	def errores
		object.errors.full_messages.any?
			content_tag(:div, :class => "error_messages") do
				content_tag(:h2, "Verifique los campos") do
					content_tag(:ul) do
						object.errors.full_messages.map do |msg|
							content_tag(:li, msg)
						end.join.html_safe
					end
				end
			end
		end
	end

end