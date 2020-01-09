@lecture_a = Lecture.create(title: "授業名AAA", content: "授業内容授業内容授業内容授業内容授業内容授業内容授業内容")
@lecture_b = Lecture.create(title: "授業名BBB", content: "授業内容授業内容授業内容授業内容授業内容授業内容授業内容")
@lecture_c = Lecture.create(title: "授業名CCC", content: "授業内容授業内容授業内容授業内容授業内容授業内容授業内容")

@lecture_a.reviews.create(rate: 1, good_point: "コメントコメントコメントコメント", bad_point: "コメントコメントコメントコメント")
@lecture_a.reviews.create(rate: 2, good_point: "コメントコメントコメントコメント", bad_point: "コメントコメントコメントコメント")
@lecture_a.reviews.create(rate: 3, good_point: "コメントコメントコメントコメント", bad_point: "コメントコメントコメントコメント")
@lecture_a.reviews.create(rate: 4, good_point: "コメントコメントコメントコメント", bad_point: "コメントコメントコメントコメント")
@lecture_a.reviews.create(rate: 5, good_point: "コメントコメントコメントコメント", bad_point: "コメントコメントコメントコメント")
