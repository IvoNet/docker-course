export interface Deserializable<T> {
  deserialize(inout: Object): T;
}
