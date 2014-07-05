module ApplicationHelper
	def agregar_linea(nombre, f, asociacion)
    new_object = f.object.send(asociacion).klass.new
    id = new_object.object_id
    fields = f.fields_for(asociacion, new_object, child_index: id) do |builder|
      render(asociacion.to_s + "_campos", f: builder)
		end
		link_to(nombre, '#', class: "agregar_campos", data: {id: id, fields: fields.gsub("\n", "")})
	end
end
