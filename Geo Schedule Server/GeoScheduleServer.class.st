Class {
	#name : #GeoScheduleServer,
	#superclass : #Object,
	#instVars : [
		'teapot',
		'schedule'
	],
	#category : #'Geo Schedule Server'
}

{ #category : #accessing }
GeoScheduleServer >> addRoutes [

	teapot GET: '/years' -> [ :request | self request_years: request ]
]

{ #category : #accessing }
GeoScheduleServer >> portNumber [
	^ 8100
]

{ #category : #'accessing requests' }
GeoScheduleServer >> request_years: aRequest [ 
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
