Class {
	#name : #GeoEventStatus,
	#superclass : #GeoStatus,
	#category : #'Geo Schedule Status'
}

{ #category : #accessing }
GeoEventStatus >> filteredColorFor: aColor [

	^ self isActive
		  ifTrue: [ aColor ]
		  ifFalse: [ aColor muchLighter ]
]

{ #category : #testing }
GeoEventStatus >> isActive [
	^symbol = 'open' or: [ 'symbol' = 'closed' ]
]
