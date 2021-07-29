Extension { #name : #Object }

{ #category : #'*Geo Schedule' }
Object >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #'*Geo Schedule' }
Object >> neoJsonMappingOn: mapping [
	
]
