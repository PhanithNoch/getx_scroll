class PublicPeople {
  List<Data> data;
  Links links;
  Meta meta;

  PublicPeople({this.data, this.links, this.meta});

  PublicPeople.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Data {
  String id;
  String createdDate;
  String createdById;
  String updatedDate;
  String updatedById;
  String phone;
  String email;
  int isActive;
  String status;
  int isAlive;
  int isDefault;
  String personType;
  String personCode;

  Data(
      {this.id,
        this.createdDate,
        this.createdById,
        this.updatedDate,
        this.updatedById,
        this.phone,
        this.email,
        this.isActive,
        this.status,
        this.isAlive,
        this.isDefault,
        this.personType,
        this.personCode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['created_date'];
    createdById = json['created_by_id'];
    updatedDate = json['updated_date'];
    updatedById = json['updated_by_id'];
    phone = json['phone'];
    email = json['email'];
    isActive = json['is_active'];
    status = json['status'];
    isAlive = json['is_alive'];
    isDefault = json['is_default'];
    personType = json['person_type'];
    personCode = json['person_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_date'] = this.createdDate;
    data['created_by_id'] = this.createdById;
    data['updated_date'] = this.updatedDate;
    data['updated_by_id'] = this.updatedById;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['is_active'] = this.isActive;
    data['status'] = this.status;
    data['is_alive'] = this.isAlive;
    data['is_default'] = this.isDefault;
    data['person_type'] = this.personType;
    data['person_code'] = this.personCode;
    return data;
  }
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  dynamic perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
