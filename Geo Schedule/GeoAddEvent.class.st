Class {
	#name : #GeoAddEvent,
	#superclass : #GeoAction,
	#category : #'Geo Schedule-Actions'
}

{ #category : #actions }
GeoAddEvent >> addTo: aSchedule [

	| event |
	event := GeoEvent new.
	event
		id: (payload at: 'id');
		dateAndTime: (DateAndTime fromString: (payload at: 'dateAndTime'));
		status: (payload at: 'status');
		description: (payload at: 'description');
		category: (aSchedule categories at: (payload at: 'category'));
		nrOfUsers: (payload at: 'nrOfUsers');
		location: (payload at: 'location').
	aSchedule events at: event id put: event.
	^event
]

{ #category : #actions }
GeoAddEvent >> privateFrom: aSchedule [

	self addIdentityFrom: aSchedule
]
