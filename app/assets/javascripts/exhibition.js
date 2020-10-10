$(function () {
  let nextInput = (num) => {
    let html = `<div class="up-image__group__dropbox" data-index="${num}", id="image_num_${num}">
  <input class="exhibition_imgs__default" 
  type="file" 
  accept="image/*", name="exhibition[images_attributes][${num}][image]", id="up_img_${num}"></input></div>`;

    return html;
  };
  //プレビュー用のimgタグ
  let previewImages = (src, num) => {
    let html = `<div class="preview preview_unsave" data-index="${num}">
  <div class="img_box">
  <img src="${src}" class="preview_image" width="120" height="70"></div>
  <div class="preview_btn">削除</div></div>`;
    return html;
  };

  $(".images").on("click", function (e) {
    e.preventDefault();
    $(".exhibition_imgs__default:last").trigger("click");
  });

  $(document).on("change", 'input[type= "file"]', function (e) {
    let reader = new FileReader(); //画像を読み込む
    let file = e.target.files[0]; //inputから1つ目のfileを取得
    reader.readAsDataURL(file); //画像ファイルのURLを取得
    let num = $(this).parent().data("index");
    let up_image__group__dropbox_count = $(".up-image__group__dropbox").length;
    let last_num = $(".up-image__group__dropbox:last").data("index");
    //画像読み込みが完了したらプレビュー表示
    reader.onload = function (e) {
      if ($(".let up_image__group__dropbox").length <= 1) {
        $(".previews").append(previewImages(e.target.result, last_num));
      }

      let preview_count = $(".preview").length;

      if (preview_count <= 4) {
        $(".up-image__group").append(nextInput(last_num + 1));
      }
    };
  });

  $(document).on("click", ".preview_btn", function () {
    let targetIndex = $(this).parent().data("name");
    let num = $(this).parent().data("index");
    let preview_saved_exsist = $(this).parent(".preview_saved").length;

    if (preview_saved_exsist != 0) {
      $(".hidden-destroy").on("click");
      $(this).parent().remove();
    } else {
      $(`[data-index="${num}"]`).remove();
    }

    if (targetIndex >= 0) {
      let hiddenCheck = $(`input[data-index="${num}"].hidden-destroy`);
      hiddenCheck.prop("checked", true);
    }
    let preview_num = $(this).parent().attr("index");
    let preview_total_num = $(this).parent().attr("data-index");
    let preview_count = $(".preview").length;
    let preview_unsave_count = $(".preview_unsave").length;
    let preview_save_count = $(".preview_saved").length;
    let preview_saved_count = $(".hidden-destroy").length;

    if (preview_num >= 0) {
      $(".image-preview[index =" + preview_num + "]").remove();
    }

    if (preview_count <= 4) {
      $(".images").show();
    }
  });
});
