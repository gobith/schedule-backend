Class {
	#name : #GeoJSONObject,
	#superclass : #OrderedDictionary,
	#category : #'Geo Schedule-JSON'
}

{ #category : #accessing }
GeoJSONObject >> categories: aCollection [ 
	
	self at: 'categories' put: aCollection
]

{ #category : #accessing }
GeoJSONObject >> category: aString [ 
	self at: 'category' put: aString
]

{ #category : #accessing }
GeoJSONObject >> categoryStatus: anObject [ 
	self at: 'categoryStatus' put: anObject
]

{ #category : #accessing }
GeoJSONObject >> dateAndTime: aString [ 
	self at: 'dateAndTime' put: aString
]

{ #category : #accessing }
GeoJSONObject >> description: aString [ 
	self at: 'description' put: aString
]

{ #category : #accessing }
GeoJSONObject >> email: aString [ 
	self at: 'email' put: aString
]

{ #category : #accessing }
GeoJSONObject >> event: anObject [

	self at: 'event' put: anObject
]

{ #category : #accessing }
GeoJSONObject >> events: anObject [ 
	self at: 'events' put: anObject
]

{ #category : #accessing }
GeoJSONObject >> id: aString [ 
	self at: 'id' put: aString
]

{ #category : #accessing }
GeoJSONObject >> isAdmin: aBoolean [ 
	
	self at: 'isAdmin' put: aBoolean
]

{ #category : #accessing }
GeoJSONObject >> location: aString [ 
	self at: 'location' put: aString
]

{ #category : #accessing }
GeoJSONObject >> loggedIn: aBoolean [ 
	self at: 'loggedIn' put: aBoolean
]

{ #category : #accessing }
GeoJSONObject >> name [

	^self at: 'name'
]

{ #category : #accessing }
GeoJSONObject >> name: aString [ 
	self at: 'name' put: aString
]

{ #category : #accessing }
GeoJSONObject >> nrOfUsers: aString [ 
	self at: 'nrOfUsers' put: aString
]

{ #category : #accessing }
GeoJSONObject >> phone: aString [ 
	self at: 'phone' put: aString
]

{ #category : #printing }
GeoJSONObject >> printOn: stream [
	"I use my JSON representation when printing myself"

	[ (NeoJSONWriter on: stream) nextPut: self ]
		on: Error
		do: [ :exception | 
			stream
				nextPutAll: ' Error printing JSON: ';
				nextPutAll: exception printString ]
]

{ #category : #accessing }
GeoJSONObject >> role: aString [ 
	self at: 'role' put: aString
]

{ #category : #accessing }
GeoJSONObject >> status: aString [ 
	self at: 'status' put: aString
]

{ #category : #accessing }
GeoJSONObject >> statusPermissions: anObject [ 
	self at: 'statusPermissions' put: anObject
]

{ #category : #accessing }
GeoJSONObject >> surname: aString [ 
	self at: 'surname' put: aString
]

{ #category : #accessing }
GeoJSONObject >> user: aString [ 
	self at: 'user' put: aString
]

{ #category : #accessing }
GeoJSONObject >> userId: userId [

	self at: 'userId' put: userId
]

{ #category : #accessing }
GeoJSONObject >> userStatus: aString [ 
	self at: 'userStatus' put: aString
]

{ #category : #accessing }
GeoJSONObject >> users: anObject [ 
	self at: 'users' put: anObject
]

{ #category : #accessing }
GeoJSONObject >> websiteRole: aString [ 
	self at: 'websiteRole' put: aString
]
