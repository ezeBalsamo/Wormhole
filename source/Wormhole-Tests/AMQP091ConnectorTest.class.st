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
				should: [ AMQP091Connector named: anInvalidName hostedIn: 'localhost' on: 5672 ]
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
				should: [ AMQP091Connector named: 'Pepe' hostedIn: anInvalidHost on: 5672 ]
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
				should: [ AMQP091Connector named: 'Pepe' hostedIn: 'localhost' on: anInvalidPort ]
				raise: InstanceCreationFailed
				withMessageText: 'Port must be positive.'
			]
]
