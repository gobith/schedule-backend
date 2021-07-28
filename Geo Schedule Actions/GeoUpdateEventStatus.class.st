Class {
	#name : #GeoUpdateEventStatus,
	#superclass : #GeoAction,
	#category : #'Geo Schedule Actions'
}

{ #category : #adding }
GeoUpdateEventStatus >> addTo: aSchedule [

	| event status |
	event := aSchedule events at: (payload at: 'event').
	status := payload at: 'status'.

	event status: status.
	^event
]
