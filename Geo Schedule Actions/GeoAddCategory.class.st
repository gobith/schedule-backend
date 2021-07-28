Class {
	#name : #GeoAddCategory,
	#superclass : #GeoAction,
	#category : #'Geo Schedule Actions'
}

{ #category : #actions }
GeoAddCategory >> addTo: aSchedule [

	| category |
	payload at: 'id' put: aSchedule nextId.
	category := GeoCategory new.
	category 
		id: (payload at: 'id');
		name: (payload at: 'name');
		description: (payload at: 'description').
	aSchedule categories at: category id put: category
]
