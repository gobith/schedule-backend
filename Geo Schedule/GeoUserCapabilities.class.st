Class {
	#name : #GeoUserCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #accessing }
GeoUserCapabilities >> events [

	| events |
	events := schedule events asOrderedCollection select: [ :event | 
		          user canViewEvent: event ].

	^ events collect: [ :event | 
		  | dict userStatus |
		  dict := OrderedDictionary new.

		  userStatus := (event userStatus asOrderedCollection select: [ :us | 
			                 us user canViewCategory: event category ]) 
			                collect: [ :each | 
				                | userStatusDict |
				                userStatusDict := OrderedDictionary new.
				                userStatusDict
					                at: 'user' put: each user id;
					                at: 'status' put: each status.
				                userStatusDict ].

		  dict
			  at: 'id' put: event id;
			  at: 'dateAndTime' put: event dateAndTimeString;
			  at: 'status' put: event status;
			  at: 'description' put: event description;
			  at: 'category' put: event category id;
			  at: 'nrOfUsers' put: event nrOfUsers;
			  at: 'location' put: event location;
			  at: 'userStatus' put: userStatus.
		  dict ]
]

{ #category : #accessing }
GeoUserCapabilities >> userObjectFor: aUser [

	| dict |
	dict := OrderedDictionary new.
	dict
		at: 'id' put: aUser id;
		at: 'name' put: aUser name;
		at: 'surname' put: aUser surname.
	^ dict
]

{ #category : #accessing }
GeoUserCapabilities >> users [

	| users |
	users := (schedule users asOrderedCollection select: [ :each | 
		          user canViewUser: each ]) asSortedCollection: [ 
		         :userA 
		         :userB | userA name <= userB name ].

	^ users collect: [ :each | self userObjectFor: each ]
]
