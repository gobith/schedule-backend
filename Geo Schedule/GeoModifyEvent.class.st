Class {
	#name : #GeoModifyEvent,
	#superclass : #GeoAction,
	#category : #'Geo Schedule-Actions'
}

{ #category : #adding }
GeoModifyEvent >> addTo: aSchedule [

	| event |

	event := aSchedule events at: (payload at: 'id').
	event
		dateAndTime: (DateAndTime fromString: (payload at: 'dateAndTime'));
		status: (payload at: 'status');
		description: (payload at: 'description');
		nrOfUsers: (payload at: 'nrOfUsers');
		location: (payload at: 'location').
	^ event
]
