Class {
	#name : #GeoAddCategory,
	#superclass : #GeoAction,
	#category : #'Geo Schedule-Actions'
}

{ #category : #actions }
GeoAddCategory >> addTo: aSchedule [

	| category |
	category := GeoCategory new.
	category 
		id: (payload at: 'id');
		name: (payload at: 'name');
		description: (payload at: 'description').
	aSchedule categories at: category id put: category
]

{ #category : #actions }
GeoAddCategory >> privateFrom: aSchedule [

	self addIdentityFrom: aSchedule
]
