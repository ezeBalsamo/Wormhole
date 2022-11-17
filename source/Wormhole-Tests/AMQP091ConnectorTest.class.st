"
An AMQP091ConnectorTest is a test class for testing the behavior of AMQP091Connector
"
Class {
	#name : #AMQP091ConnectorTest,
	#superclass : #TestCase,
	#category : #'Wormhole-Tests'
}

{ #category : #tests }
AMQP091ConnectorTest >> test01NameCannotBeBlank [

	OrderedCollection new
		add: '';
		add: ' ';
		do: [ :anInvalidName | 
			self
				should: [ 
					AMQP091Connector
						named: anInvalidName
						hostedIn: 'localhost'
						on: 5672
						identifiedBy: 'Matt Murdock'
						and: 'Daredevil'
						delayingUpTo: 10 seconds
					]
				raise: InstanceCreationFailed
				withMessageText: 'Name cannot be blank.'
			]
]

{ #category : #tests }
AMQP091ConnectorTest >> test02HostCannotBeBlank [

	OrderedCollection new
		add: '';
		add: ' ';
		do: [ :anInvalidHost | 
			self
				should: [ 
					AMQP091Connector
						named: 'Pepe'
						hostedIn: anInvalidHost
						on: 5672
						identifiedBy: 'Matt Murdock'
						and: 'Daredevil'
						delayingUpTo: 10 seconds
					]
				raise: InstanceCreationFailed
				withMessageText: 'Host cannot be blank.'
			]
]

{ #category : #tests }
AMQP091ConnectorTest >> test03PortMustBePositive [

	OrderedCollection new
		add: -1;
		add: 0;
		do: [ :anInvalidPort | 
			self
				should: [ 
					AMQP091Connector
						named: 'Pepe'
						hostedIn: 'localhost'
						on: anInvalidPort
						identifiedBy: 'Matt Murdock'
						and: 'Daredevil'
						delayingUpTo: 10 seconds
					]
				raise: InstanceCreationFailed
				withMessageText: 'Port must be positive.'
			]
]

{ #category : #tests }
AMQP091ConnectorTest >> test04UsernameCannotBeBlank [

	OrderedCollection new
		add: '';
		add: ' ';
		do: [ :anInvalidUsername | 
			self
				should: [ 
					AMQP091Connector
						named: 'Pepe'
						hostedIn: 'localhost'
						on: 5672
						identifiedBy: anInvalidUsername
						and: 'Daredevil'
						delayingUpTo: 10 seconds
					]
				raise: InstanceCreationFailed
				withMessageText: 'Username cannot be blank.'
			]
]

{ #category : #tests }
AMQP091ConnectorTest >> test05PasswordCannotBeBlank [

	OrderedCollection new
		add: '';
		add: ' ';
		do: [ :anInvalidPassword | 
			self
				should: [ 
					AMQP091Connector
						named: 'Pepe'
						hostedIn: 'localhost'
						on: 5672
						identifiedBy: 'Matt Murdock'
						and: anInvalidPassword
						delayingUpTo: 10 seconds
					]
				raise: InstanceCreationFailed
				withMessageText: 'Password cannot be blank.'
			]
]

{ #category : #tests }
AMQP091ConnectorTest >> test06TimeoutDelayMustBePositive [

	self
		should: [ 
			AMQP091Connector
				named: 'Pepe'
				hostedIn: 'localhost'
				on: 5672
				identifiedBy: 'Matt Murdock'
				and: 'Daredevil'
				delayingUpTo: -1 second
			]
		raise: InstanceCreationFailed
		withMessageText: 'Timeout delay must be positive.'
]

{ #category : #tests }
AMQP091ConnectorTest >> test07InstanceCreationAndAccessing [

	| connector |

	connector := AMQP091Connector
		             named: 'Pepe'
		             hostedIn: 'localhost'
		             on: 5672
		             identifiedBy: 'Matt Murdock'
		             and: 'Daredevil'
		             delayingUpTo: 1 minute.

	self
		assert: connector name equals: 'Pepe';
		assert: connector host equals: 'localhost';
		assert: connector port equals: 5672;
		assert: connector username equals: 'Matt Murdock';
		assert: connector password equals: 'Daredevil';
		assert: connector timeoutDelayInSeconds equals: 60 seconds;
		assert: connector asString
		equals: 'Pepe''s AMQP 091 connector for localhost:5672, granting access to Matt Murdock'
]
