Class {
	#name : #GeoMonth,
	#superclass : #GeoNode,
	#category : #'Geo Schedule-Templates'
}

{ #category : #accessing }
GeoMonth >> monthNameForIndex: monthIndex [

	^ { 'Jan'. 'Feb'. 'Mrt'. 'Apr'. 'Mei'. 'Jun'. 'Jul'. 'Aug'. 'Sep'.
	  'Okt'. 'Nov'. 'Dec' } at: monthIndex
]

{ #category : #accessing }
GeoMonth >> name [ 
	^self monthNameForIndex: timespan index
]
