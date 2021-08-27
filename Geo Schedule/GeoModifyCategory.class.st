Class {
	#name : #GeoModifyCategory,
	#superclass : #GeoAction,
	#category : #'Geo Schedule-Actions'
}

{ #category : #actions }
GeoModifyCategory >> addTo: aSchedule [

	| category |
	category := aSchedule categories at: (payload at: 'id').
	category
		name: (payload at: 'name');
		description: (payload at: 'description').
	^ category
]
