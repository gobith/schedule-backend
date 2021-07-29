Class {
	#name : #GeoUpdateUserEventStatus,
	#superclass : #GeoAction,
	#category : #'Geo Schedule Actions'
}

{ #category : #actions }
GeoUpdateUserEventStatus >> addTo: aSchedule [

	| user event status userEventStatus |
	user := aSchedule users at: (payload at: 'user').
	event := aSchedule events at: (payload at: 'event').
	status := payload at: 'status'.

	userEventStatus := GeoUserEventStatus new.
	userEventStatus
		user: user;
		event: event;
		status: status.

	event userStatus at: user id put: userEventStatus.
	user eventStatus at: event id put: userEventStatus.
	^ userEventStatus
]
