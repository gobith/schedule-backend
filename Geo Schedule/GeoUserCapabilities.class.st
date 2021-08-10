Class {
	#name : #GeoUserCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #accessing }
GeoUserCapabilities >> eventObjectFor: event [

	^ self newJSONObject
		  id: event id;
		  dateAndTime: event dateAndTimeString;
		  status: event status;
		  description: event description;
		  category: event category id;
		  nrOfUsers: event nrOfUsers;
		  location: event location;
		  userStatus:
			  ((event userStatus asOrderedCollection select: [ :us | 
					    us user canViewCategory: event category ]) collect: [ :each | 
					   self newJSONObject
						   user: each user id;
						   status: each status;
						   yourself ]);
		  yourself
]

{ #category : #accessing }
GeoUserCapabilities >> events [

	| events |
	events := schedule events asOrderedCollection select: [ :event | 
		          user canViewEvent: event ].

	^ events collect: [ :event | self eventObjectFor: event ]
]

{ #category : #accessing }
GeoUserCapabilities >> userObjectFor: aUser [

	^ self newJSONObject
		  id: aUser id;
		  name: aUser name;
		  surname: aUser surname;
		  showInSchedule: aUser showInSchedule;
		  yourself
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
