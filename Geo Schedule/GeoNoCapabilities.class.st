Class {
	#name : #GeoNoCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #actions }
GeoNoCapabilities >> addEvent: aRequest [

	^nil
]

{ #category : #accessing }
GeoNoCapabilities >> categories [ 
	^#()
]

{ #category : #accessing }
GeoNoCapabilities >> events [

	^#()
]

{ #category : #accessing }
GeoNoCapabilities >> loggedIn [ 
	^false
]

{ #category : #actions }
GeoNoCapabilities >> modifyCategory: aRequest [

	^nil
]

{ #category : #accessing }
GeoNoCapabilities >> statusPermission [

	^#()
]

{ #category : #accessing }
GeoNoCapabilities >> userId [ 
	^nil
]

{ #category : #accessing }
GeoNoCapabilities >> users [

	^#()
]
