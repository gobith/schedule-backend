Class {
	#name : #GeoYearsTemplate,
	#superclass : #Object,
	#instVars : [
		'years',
		'category'
	],
	#category : #'Geo Schedule Templates'
}

{ #category : #'instance creation' }
GeoYearsTemplate class >> category: aCategory schedule: aSchedule [

	^self new category: aCategory schedule: aSchedule
]

{ #category : #accessing }
GeoYearsTemplate >> addDay: aDate events: eventCollection to: aCollection [ 
	
	| day |
	day := GeoDay new timespan: aDate.
	aCollection add: day.
	eventCollection do: [ : event | day children add: event ]
]

{ #category : #accessing }
GeoYearsTemplate >> addMonth: aMonth events: eventCollection to: aCollection [

	| month |
	month := GeoMonth new timespan: aMonth.
	aCollection add: month.
	(eventCollection partition: [ :event | event dateAndTime asDate ]) 
		keysAndValuesDo: [ :day :eventsPerDay | 
			self addDay: day events: eventsPerDay to: month children ]
]

{ #category : #accessing }
GeoYearsTemplate >> addYear: aYear events: eventCollection [

	 
	
]

{ #category : #accessing }
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
	years := SortedCollection sortBlock: [ :a :b | a < b ].
	events := aSchedule events asOrderedCollection select: [ :each | 
		          each category = aCategory ].
	(events partition: [ :event | event dateAndTime asYear ]) 
		keysAndValuesDo: [ :year :eventsPerYear | 
		self addYear: year events: eventsPerYear to: years ]
]
