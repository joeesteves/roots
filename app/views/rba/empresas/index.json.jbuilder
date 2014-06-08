	json.array!(@rba_empresas) do |rba_empresa|
		json.extract! rba_empresa, :id, :codigo, :nombre, :cuit
		json.catfiscal(rba_empresa.catfiscal.nombre)
		json.empresagrupo(rba_empresa.empresagrupo.nombre)
		
		json.url rba_empresa_url(rba_empresa, format: :json)
		
	end