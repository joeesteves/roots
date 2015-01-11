class EstandarFormBuilder < ActionView::Helpers::FormBuilder
	delegate  :content_tag, to: :@template
	%w[text_field 
		text_area
		password_field 
		collection_select
		select
		number_field
		grouped_collection_select
		check_box].each do |method_name|

		define_method(method_name) do |nombre,*args|	
			options = args.extract_options!

			if options[:label]
				label = options[:label]
			else
				label = nombre.capitalize
			end

			
			unless options[:sinEtiqueta]
				"<span class='prefix postfix'>#{label.to_s}</span>".html_safe + 
				super(nombre,*args, options)
			else
				options.delete(:sinEtiqueta)
				super(nombre,*args, options)
			end
		
		end

		def date_select(nombre, opciones = {})
			html_options = ""
			
			opciones.each do |k,v|
				
				html_options += k.to_s + "=" + v.to_s + " "
				p html_options			
			end
			
			unless opciones[:sinEtiqueta]
				"<span class='prefix postfix'>#{nombre.to_s.capitalize}</span>".html_safe + 
				"<input type='date' id=#{object_name}_fecha 
				name=#{object_name}[#{nombre}] value='#{object.send(nombre)}' #{html_options} />".html_safe
			else
				"<input type='date' id=#{object_name}_fecha 
				name=#{object_name}[#{nombre}] value='#{object.send(nombre)}' #{html_options} />".html_safe
			end	

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

	def objectify_options(options)
    super.except(:label, :sinEtiqueta)
  end

end