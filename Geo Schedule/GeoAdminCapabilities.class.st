Class {
	#name : #GeoAdminCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #accessing }
GeoAdminCapabilities >> events [

	| events |
	events := schedule events asOrderedCollection.
	^ events collect: [ :event | 
		  | dict userStatus |
		  dict := OrderedDictionary new.

		  userStatus := event userStatus asOrderedCollection collect: [ 
			                :each | 
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
GeoAdminCapabilities >> userObjectFor: aUser [

	| dict categoryStatus |
	categoryStatus := aUser categoryStatus asOrderedCollection collect: [ 
		                  :each | 
		                  | categoryStatusDict |
		                  categoryStatusDict := OrderedDictionary new.
		                  categoryStatusDict
			                  at: 'category' put: each category id;
			                  at: 'status' put: each status.
		                  categoryStatusDict ].
	dict := OrderedDictionary new.
	dict
		at: 'id' put: aUser id;
		at: 'name' put: aUser name;
		at: 'surname' put: aUser surname;
		at: 'email' put: aUser email;
		at: 'phone' put: aUser phone;
		at: 'role' put: aUser role;
		at: 'websiteRole' put: aUser websiteRole;
		at: 'categoryStatus' put: categoryStatus.
	^ dict
]

{ #category : #accessing }
GeoAdminCapabilities >> users [

	| users |
	users := schedule users asSortedCollection: [ :userA :userB | 
		         userA name <= userB name ].

	^ users collect: [ :each | self userObjectFor: each ]
]
