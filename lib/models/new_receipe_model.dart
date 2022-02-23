class NewReceipeModel {
  NewReceipeModel({
    this.feed,
  });

  final List<Feed>? feed;

  factory NewReceipeModel.fromJson(Map<String, dynamic> json) => NewReceipeModel(
        feed: json["feed"] == null ? null : List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
      );
}

class Feed {
  Feed({
    this.content,
  });

  final Content? content;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        content: json["content"] == null ? null : Content.fromJson(json["content"]),
      );
}

class Content {
  Content({
    this.description,
    this.details,
    this.relatedContent,
  });

  final Description? description;
  final Details? details;
  final RelatedContent? relatedContent;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        description: json["description"] == null ? null : Description.fromJson(json["description"]),
        details: json["details"] == null ? null : Details.fromJson(json["details"]),
        relatedContent: json["relatedContent"] == null ? null : RelatedContent.fromJson(json["relatedContent"]),
      );
}

class Description {
  Description({
    this.mobileSectionName,
    this.text,
    this.shortText,
  });

  final String? mobileSectionName;
  final String? text;
  final dynamic shortText;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        mobileSectionName: json["mobileSectionName"] == null ? null : json["mobileSectionName"],
        text: json["text"] == null ? null : json["text"],
        shortText: json["shortText"],
      );
}

class Details {
  Details({
    this.directionsUrl,
    this.totalTime,
    this.displayName,
    this.images,
    this.name,
    this.brand,
    this.id,
    this.recipeId,
    this.numberOfServings,
    this.globalId,
    this.totalTimeInSeconds,
    this.rating,
  });

  final String? directionsUrl;
  final String? totalTime;
  final String? displayName;
  final List<Image>? images;
  final String? name;
  final dynamic brand;
  final String? id;
  final String? recipeId;
  final int? numberOfServings;
  final String? globalId;
  final int? totalTimeInSeconds;
  final double? rating;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        directionsUrl: json["directionsUrl"] == null ? null : json["directionsUrl"],
        totalTime: json["totalTime"] == null ? null : json["totalTime"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        brand: json["brand"],
        id: json["id"] == null ? null : json["id"],
        recipeId: json["recipeId"] == null ? null : json["recipeId"],
        numberOfServings: json["numberOfServings"] == null ? null : json["numberOfServings"],
        globalId: json["globalId"] == null ? null : json["globalId"],
        totalTimeInSeconds: json["totalTimeInSeconds"] == null ? null : json["totalTimeInSeconds"],
        rating: json["rating"] == null ? null : json["rating"],
      );
}

class Image {
  Image({
    this.hostedLargeUrl,
    this.resizableImageUrl,
    this.resizableImageHeight,
    this.resizableImageWidth,
  });

  final String? hostedLargeUrl;
  final String? resizableImageUrl;
  final int? resizableImageHeight;
  final int? resizableImageWidth;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        hostedLargeUrl: json["hostedLargeUrl"] == null ? null : json["hostedLargeUrl"],
        resizableImageUrl: json["resizableImageUrl"] == null ? null : json["resizableImageUrl"],
        resizableImageHeight: json["resizableImageHeight"] == null ? null : json["resizableImageHeight"],
        resizableImageWidth: json["resizableImageWidth"] == null ? null : json["resizableImageWidth"],
      );
}

class RelatedContent {
  RelatedContent({
    this.mobileSectionName,
    this.queryParams,
  });

  final String? mobileSectionName;
  final QueryParams? queryParams;

  factory RelatedContent.fromJson(Map<String, dynamic> json) => RelatedContent(
        mobileSectionName: json["mobileSectionName"] == null ? null : json["mobileSectionName"],
        queryParams: json["queryParams"] == null ? null : QueryParams.fromJson(json["queryParams"]),
      );
}

class QueryParams {
  QueryParams({
    this.start,
    this.apiFeedType,
    this.id,
  });

  final int? start;
  final String? apiFeedType;
  final String? id;

  factory QueryParams.fromJson(Map<String, dynamic> json) => QueryParams(
        start: json["start"] == null ? null : json["start"],
        apiFeedType: json["apiFeedType"] == null ? null : json["apiFeedType"],
        id: json["id"] == null ? null : json["id"],
      );
}
