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

	def agregar_linea_en_operacion(nombre, f, asociacion, saldotipo)
    new_object = f.object.send(asociacion).klass.new
    id = new_object.object_id
    new_object.fecha = Date.today() if new_object.respond_to?(:fecha)
	new_object.saldotipo = saldotipo
    fields = f.fields_for(asociacion, new_object, child_index: id) do |builder|
      render(asociacion.to_s + "_campos", f: builder)
		end
		link_to(nombre, '#', class: "agregar_campos_#{nombre}", data: {id: id, fields: fields.gsub("\n", "")}, remote:true)
	end

end
