
// Simple example playground to see the loading and decoding of a JSON file

struct Company {
  let name : String
  let employees : [Person]
  
  init(jsonDictionary: JSONDictionary) throws {
    name = try jsonDictionary.jsonKey("name")
    employees = try jsonDictionary.jsonKey("employees")
  }
}

// Nested struct
struct Person : Decodable {
  
  let name : String
  let age : Int
  
  init(jsonDictionary: JSONDictionary) throws {
    name = try jsonDictionary.jsonKey("name")
    age = try jsonDictionary.jsonKey("age")
  }
  
}

do {
  let jsonDictionary = try JSONDictionary.fromFile("example")
  let company = try Company(jsonDictionary: jsonDictionary)
  
  print(company.name)
  print(company.employees.first!.age)
  
} catch {}


class City {
  
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
  init?(jsonDictionary: JSONDictionary) {
    do {
      name = try jsonDictionary.jsonKey("name")
    } catch {
      name = ""
      return nil
    }
  }
  
  convenience init(throwingJSONDictionary: JSONDictionary) throws {
    self.init(
      name : try throwingJSONDictionary.jsonKey("name")
    )
  }
}

let validRawVehicleDictionary = ["name": "London"]
let validCity = City(jsonDictionary: validRawVehicleDictionary)
print(validCity?.name)


let invalidRawVehicleDictionary = ["afe": "London"]
let invalidCity = City(jsonDictionary: invalidRawVehicleDictionary)
print(invalidCity?.name)

do {
  let invalidCity = try City(throwingJSONDictionary: invalidRawVehicleDictionary)
} catch {
  print(error)
}
