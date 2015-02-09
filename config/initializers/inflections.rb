# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )

	inflecciones = {
		'accion' => 'acciones',
		'actividad' => 'actividades',
		'animal' => 'animales',
		'aplicacion' => 'aplicaciones',
		'arbol' => 'arboles',
		'categoria' => 'categorias',
		'catfiscal' => 'catfiscales',
		'cotizacion' => 'cotizaciones',
		'cuenta' => 'cuentas',
		'loteutilizacion' => 'loteutilizaciones',
		'model' => 'modelos',
		'nota' => 'notas',
		'operacion' => 'operaciones',
		'operacionorigen' => 'operacionorigenes',
		'sesion' => 'sesiones',
		'unidad' => 'unidades',
		'organizacion' => 'organizaciones',
	}
	
	inflecciones.each do |k,v|
		inflect.irregular k, v
	end
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
