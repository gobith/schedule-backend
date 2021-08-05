Class {
	#name : #GeoScheduleServer,
	#superclass : #Object,
	#instVars : [
		'teapot',
		'schedule'
	],
	#category : #'Geo Schedule-Server'
}

{ #category : #'accessing requests' }
GeoScheduleServer >> addCategory: aRequest [

	self halt
]

{ #category : #accessing }
GeoScheduleServer >> addRoutes [


	teapot GET: '/schedule/contents' -> [ :request | self requestSchedule: request ].
	teapot GET: '/schedule/login' -> [ :request | self login: request ].
	teapot PUT: '/schedule/category/add' -> [ :request | self addCategory: request ].
	teapot PUT: '/schedule/category/modify' -> [ :request | self modifyCategory: request ].
	teapot PUT: '/schedule/user/add' -> [ :request | self addUser: request ].
	teapot PUT: '/schedule/user/modify' -> [ :request | self modifyUser: request ]
	
]

{ #category : #'accessing requests' }
GeoScheduleServer >> addUser: aRequest [

	self halt
]

{ #category : #'accessing requests' }
GeoScheduleServer >> login: aRequest [

	| authorization email password user session |
	authorization := [ aRequest basicAuthentication ]
		                 on: Error
		                 do: [ nil ].

	authorization ifNil: [ ^ GeoNoCapabilities new scheduleObject ].
	email := authorization first.
	password := authorization last.

	user := schedule userWithEmail: email.
	user ifNil: [ ^ GeoNoCapabilities new scheduleObject ].
	user password = password ifFalse: [ 
		^ GeoNoCapabilities new scheduleObject ].
	session := aRequest session.
	session attributeAt: 'user' put: user id.

	^ (self userCapabiltiesForUser: user) scheduleObject
]

{ #category : #'accessing requests' }
GeoScheduleServer >> modifyCategory: aRequest [

	self halt
]

{ #category : #'accessing requests' }
GeoScheduleServer >> modifyUser: aRequest [

	| capabilities |
	capabilities := GeoAdminCapabilities
		                schedule: schedule
		                user: (schedule userNamed: 'Georges Kerssies').

	^ capabilities modifyUser: aRequest
]

{ #category : #accessing }
GeoScheduleServer >> portNumber [
	^ 8100
]

{ #category : #'accessing requests' }
GeoScheduleServer >> requestSchedule: aRequest [

	"	| isAdmin user |
	isAdmin := (aRequest at: #admin) = 'true'.

	user := isAdmin
		        ifTrue: [ schedule userNamed: 'Georges Kerssies' ]
		        ifFalse: [ schedule userNamed: 'Joost Kuiper' ].
		
	^(user capabilitiesFor: schedule) scheduleObject"

	^ (self userCapabiltiesForUser: (self sessionUserFor: aRequest))
		  scheduleObject
]

{ #category : #'accessing requests old' }
GeoScheduleServer >> requestYears: aRequest [ 

	^schedule templateAtCategory: (schedule categoryNamed: 'Oud Papier') typeClass: GeoYearsTemplate
]

{ #category : #accessing }
GeoScheduleServer >> sessionUserFor: aRequest [

	| session user |
	user := nil.
	session := aRequest session.
	session isValid ifTrue: [ 
		(session attributeAt: 'user' ifAbsent: [ nil ]) ifNotNil: [ :userId | 
			user := schedule userAt: userId ] ].
	^ user
]

{ #category : #accessing }
GeoScheduleServer >> start [

	self stop.
	
	schedule := GeoSchedule  new.
	schedule fileIn.
	teapot := Teapot configure: {(#port -> self portNumber) . #defaultOutput -> #json . #debugMode -> true}.
	self addRoutes.
	teapot start
]

{ #category : #accessing }
GeoScheduleServer >> stop [ 
	
	teapot ifNotNil: [ teapot stop ].
	teapot := nil.
	schedule := nil
]

{ #category : #accessing }
GeoScheduleServer >> userCapabiltiesForUser: aUserOrNil [

	^ aUserOrNil
		  ifNil: [ GeoNoCapabilities schedule: schedule user: nil ]
		  ifNotNil: [ 
		  aUserOrNil capabilitiesFor: schedule ]
]
