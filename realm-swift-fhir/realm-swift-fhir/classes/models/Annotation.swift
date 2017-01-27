//
//  Annotation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Annotation) on 2017-01-27.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Text node with attribution.
 *
 *  A  text note which also  contains information about who made the statement and when.
 */
open class Annotation: Element {
	override open class var resourceType: String {
		get { return "Annotation" }
	}

	public dynamic var authorReference: Reference?
	public dynamic var authorString: String?
	public dynamic var text: String?
	public dynamic var time: DateTime?

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(text: String) {
		self.init(json: nil)
		self.text = text
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["authorReference"] {
				presentKeys.insert("authorReference")
				if let val = exist as? FHIRJSON {
					self.authorReference = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "authorReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["authorString"] {
				presentKeys.insert("authorString")
				if let val = exist as? String {
					self.authorString = val
				}
				else {
					errors.append(FHIRJSONError(key: "authorString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "text"))
			}
			if let exist = js["time"] {
				presentKeys.insert("time")
				if let val = exist as? String {
					self.time = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "time", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let authorReference = self.authorReference {
			json["authorReference"] = authorReference.asJSON()
		}
		if let authorString = self.authorString {
			json["authorString"] = authorString.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let time = self.time {
			json["time"] = time.asJSON()
		}
		
		return json
	}
}
