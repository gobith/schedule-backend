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
GeoScheduleServer >> addOrUpdateCategory: aRequest [

	self halt
]

{ #category : #'accessing requests' }
GeoScheduleServer >> addOrUpdateUser: aRequest [

	self halt.
	NeoJSONReader fromString: aRequest contents.
	^Dictionary new at: 'test' put: 1234; yourself
]

{ #category : #accessing }
GeoScheduleServer >> addRoutes [

	teapot GET: '/years' -> [ :request | self requestYears: request ].
	teapot GET: '/schedule/<admin>' -> [ :request | self requestSchedule: request ].
	teapot PUT: '/schedule/category' -> [ :request | self addOrUpdateCategory: request ].
	teapot PUT: '/schedule/user' -> [ :request | self addOrUpdateUser: request ]
	
]

{ #category : #accessing }
GeoScheduleServer >> portNumber [
	^ 8100
]

{ #category : #'accessing requests' }
GeoScheduleServer >> requestSchedule: aRequest [

	| isAdmin user |
	isAdmin := (aRequest at: #admin) = 'true'.

	user := isAdmin
		        ifTrue: [ schedule userNamed: 'Georges Kerssies' ]
		        ifFalse: [ schedule userNamed: 'Joost Kuiper' ].
		
	^(user capabilitiesFor: schedule) scheduleObjects
]

{ #category : #'accessing requests' }
GeoScheduleServer >> requestYears: aRequest [ 

	^schedule templateAtCategory: (schedule categoryNamed: 'Oud Papier') typeClass: GeoYearsTemplate
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
