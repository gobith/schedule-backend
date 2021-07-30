Class {
	#name : #GeoYearsTemplate,
	#superclass : #Object,
	#instVars : [
		'years',
		'category',
		'users',
		'eventUsers'
	],
	#category : #'Geo Schedule Templates'
}

{ #category : #'instance creation' }
GeoYearsTemplate class >> category: aCategory schedule: aSchedule [

	^self new category: aCategory schedule: aSchedule
]

{ #category : #accessing }
GeoYearsTemplate class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #userObjects to: #users;
		mapInstVar: #years
]

{ #category : #private }
GeoYearsTemplate >> addDay: aDate events: eventCollection to: aCollection [

	| day |
	day := GeoDay new timespan: aDate.
	aCollection add: day.
	eventCollection do: [ :event | self addEvent: event to: day children ]
]

{ #category : #private }
GeoYearsTemplate >> addEvent: anEvent to: aCollection [ 
	
	| eventUsr |
	eventUsr := GeoEventUsers new event: anEvent.
	aCollection add: eventUsr.
	eventUsr template: self.
	
	eventUsers at: anEvent id put: eventUsr
]

{ #category : #private }
GeoYearsTemplate >> addMonth: aMonth events: eventCollection to: aCollection [

	| month |
	month := GeoMonth new timespan: aMonth.
	aCollection add: month.
	(eventCollection partition: [ :event | event dateAndTime asDate ]) 
		keysAndValuesDo: [ :day :eventsPerDay | 
			self addDay: day events: eventsPerDay to: month children ]
]

{ #category : #private }
GeoYearsTemplate >> addYear: aYear events: eventCollection [

	 
	
]

{ #category : #private }
GeoYearsTemplate >> addYear: aYear events: eventCollection to: aCollection [

	| year |
	year := GeoYear new timespan: aYear.
	aCollection add: year.
	(eventCollection partition: [ :event | event dateAndTime asMonth ]) 
		keysAndValuesDo: [ :month :eventsPerMonth | 
			self addMonth: month events: eventsPerMonth to: year children ]
]

{ #category : #'instance creation' }
GeoYearsTemplate >> category: aCategory schedule: aSchedule [

	| events |
	category := aCategory.
	eventUsers := Dictionary new.

	users := (aSchedule users select: [ :user | 
		          user canViewCategory: aCategory ]) asSortedCollection: [ 
		         :userA 
		         :userB | userA name <= userB name ].

	years := SortedCollection sortBlock: [ :a :b | a <= b ].
	events := aSchedule events asOrderedCollection select: [ :each | 
		          each category = aCategory ].
	(events partition: [ :event | event dateAndTime asYear ]) 
		keysAndValuesDo: [ :year :eventsPerYear | 
			self addYear: year events: eventsPerYear to: years ]
]

{ #category : #'as yet unclassified' }
GeoYearsTemplate >> neoJsonMappingOn: mapping [
	self halt
]

{ #category : #'accessing-objects' }
GeoYearsTemplate >> userObjects [

	^ users collect: [ :user | 
		  { 
			  ('id' -> user id).
			  ('name' -> user name) } asDictionary ]
]

{ #category : #accessing }
GeoYearsTemplate >> users [
	^ users
]
