Class {
	#name : #GeoAdminCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #accessing }
GeoAdminCapabilities >> categories [

	^ (schedule categories asSortedCollection: [ :catA :catB | 
		   catA name <= catB name ]) collect: [ :category | 
		  self categoryObjectFor: category ]
]

{ #category : #accessing }
GeoAdminCapabilities >> categoryObjectFor: category [

	^ GeoJSONObject new
		  id: category id;
		  name: category name;
		  description: category description;
		  statusPermissions: (GeoJSONObject new
				   event: #( 'open' 'closed' 'finished' 'archived' );
				   user: #( 'confirmedScheduling' 'iCan' 'iCanNot' 'neutral' 'scheduled' );
				   yourself);
		  yourself
]

{ #category : #accessing }
GeoAdminCapabilities >> eventObjectFor: event [

	^ self newJSONObject
		  id: event id;
		  dateAndTime: event dateAndTimeString;
		  status: event status;
		  description: event description;
		  category: event category id;
		  nrOfUsers: event nrOfUsers;
		  location: event location;
		  userStatus:
			  (event userStatus asOrderedCollection collect: [ :each | 
					   self newJSONObject
						   user: each user id;
						   status: each status;
						   yourself ]);
		  yourself
]

{ #category : #accessing }
GeoAdminCapabilities >> events [

	^ schedule events asOrderedCollection 
			collect: [ :event | self eventObjectFor: event ]
]

{ #category : #'accessing requests' }
GeoAdminCapabilities >> modifyUser: aRequest [

	| dict |
	dict := NeoJSONReader fromString: aRequest contents.

	user := schedule modifyUser: dict.
	
	^self userObjectFor: user
]

{ #category : #accessing }
GeoAdminCapabilities >> userObjectFor: aUser [

	^ self newJSONObject
		  id: aUser id;
		  name: aUser name;
		  surname: aUser surname;
		  email: aUser email;
		  phone: aUser phone;
		  role: aUser role;
		  websiteRole: aUser websiteRole;
		  showInSchedule: aUser showInSchedule;
		  categoryStatus:
			  (aUser categoryStatus asOrderedCollection collect: [ :each | 
					   self newJSONObject
						   category: each category id;
						   status: each status;
						   yourself ]);
		  yourself
]

{ #category : #accessing }
GeoAdminCapabilities >> users [

	^ (schedule users 
		asSortedCollection: [ :userA :userB | userA name <= userB name ]) 
		collect: [ :each | self userObjectFor: each ]
]
