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
		  | dict |
		  dict := OrderedDictionary new.
		  dict
			  at: 'id' put: event id;
			  at: 'dateAndTime' put: event dateAndTimeString;
			  at: 'status' put: event status;
			  at: 'description' put: event description;
			  at: 'category' put: event category id;
			  at: 'nrOfUsers' put: event nrOfUsers;
			  at: 'location' put: event location.
		  dict ]
]

{ #category : #accessing }
GeoAdminCapabilities >> userObjectFor: aUser [

	| dict eventStatus categoryStatus |
	eventStatus := aUser eventStatus asOrderedCollection collect: [ :each | 
		               | eventStatusDict |
		               eventStatusDict := OrderedDictionary new.
		               eventStatusDict
			               at: 'event' put: each event id;
			               at: 'status' put: each status.
		               eventStatusDict ].
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
		at: 'eventStatus' put: eventStatus;
		at: 'categoryStatus' put: categoryStatus.
	^dict
]

{ #category : #accessing }
GeoAdminCapabilities >> users [

	| users |
	users := schedule users asSortedCollection: [ :userA :userB | 
		         userA name <= userB name ].

	^ users collect: [ :each | self userObjectFor: each ]
]
