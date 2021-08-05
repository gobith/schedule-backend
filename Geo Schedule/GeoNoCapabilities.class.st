Class {
	#name : #GeoNoCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #accessing }
GeoNoCapabilities >> events [

	^self newJSONObject
]

{ #category : #accessing }
GeoNoCapabilities >> users [

	^self newJSONObject
]
