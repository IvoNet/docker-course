import {Deserializable} from './deserializable';

export class Kwetter implements Deserializable<Kwetter> {
  public id: string;
  public name: string;
  public message: string;

  deserialize(input): Kwetter {
    this.id = input.id;
    this.name = input.name;
    this.message = input.message;
    return this;
  }
}
