module ApplicationHelper
	def agregar_linea(nombre, f, asociacion)
    new_object = f.object.send(asociacion).klass.new
    id = new_object.object_id
    new_object.fecha = Date.today() if new_object.respond_to?(:fecha)
    fields = f.fields_for(asociacion, new_object, child_index: id) do |builder|
      render(asociacion.to_s + "_campos", f: builder)
		end
		link_to(nombre, '#', class: "agregar_campos", data: {id: id, fields: fields.gsub("\n", "")}, remote:true)
	end

	def agregar_linea_con_atributos(nombre, f, asociacion, atributos = {})
    new_object = f.object.send(asociacion).klass.new
    id = new_object.object_id
    new_object.fecha = Date.today() if new_object.respond_to?(:fecha)
    unless atributos.empty?
    	atributos.each do |k,v|
    		new_object.update_attributes(k => v) 
    	end
    end
    fields = f.fields_for(asociacion, new_object, child_index: id) do |builder|
      render(asociacion.to_s + "_campos", f: builder)
		end
		link_to(nombre, '#', class: "agregar_campos_#{nombre}", data: {id: id, fields: fields.gsub("\n", "")}, remote:true)
	end

end
