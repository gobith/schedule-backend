Class {
	#name : #GeoAddEvent,
	#superclass : #GeoAction,
	#category : #'Geo Schedule Actions'
}

{ #category : #adding }
GeoAddEvent >> addTo: aSchedule [

	| event |
	payload at: 'id' put: aSchedule nextId.
	event := GeoEvent new.
	event
		id: (payload at: 'id');
		dateAndTime: (DateAndTime fromString: (payload at: 'dateAndTime'));
		status: (payload at: 'status');
		description: (payload at: 'description');
		category: (aSchedule categories at: (payload at: 'category'));
		nrOfUsers: (payload at: 'nrOfUsers');
		location: (payload at: 'location').
	aSchedule events at: event id put: event
]
