Class {
	#name : #GeoTestDatabase,
	#superclass : #GeoDatabase,
	#instVars : [
		'file',
		'index'
	],
	#category : #'Geo Schedule-Tests'
}

{ #category : #accessing }
GeoTestDatabase >> file [
	^ file
]

{ #category : #accessing }
GeoTestDatabase >> file: aString [ 
	file := aString
]

{ #category : #accessing }
GeoTestDatabase >> fileContents [

	^file
]

{ #category : #initialization }
GeoTestDatabase >> initialize [ 

	super initialize.
	file := ''.
	index := 0.
]

{ #category : #accessing }
GeoTestDatabase >> modDateAndTime [ 

	^DateAndTime fromString: '2021-07-26T00:00:00+02:00'
]

{ #category : #accessing }
GeoTestDatabase >> newSchedule [

	| newSchedule db |
	newSchedule := GeoSchedule new.
	db := GeoTestDatabase new.
	db file: file.
	newSchedule database: db.
	newSchedule fileIn.
	^ newSchedule
]

{ #category : #accessing }
GeoTestDatabase >> nextId [

	index := index + 1.
	^index asString
]

{ #category : #writing }
GeoTestDatabase >> write: aSTONString [

	"file := file , aSTONString , Character null asString"
]
