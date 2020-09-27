$(function () {
  const buildFileField = (index) => {
    const html = `<div data-index="${index}" class="group">
                    <input class="file" type="file"
                    name="exhibition[images_attributes][${index}][image]"
                    id="exhibition_images_attributes_${index}_image"><br>
                    <div class="remove">削除</div>
                  </div>`;
    return html;
  };

  let fileIndex = [1, 2, 3, 4, 5];

  $(".sell__main__content__file__up__box").on("change", ".file", function (e) {
    $(".sell__main__content__file__up__box").append(
      buildFileField(fileIndex[0])
    );
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  $(".sell__main__content__file__up__box").on("click", ".remove", function () {
    $(this).parent().remove();
    if ($(".file").length == 0)
      $(".sell__main__content__file__up__box").append(
        buildFileField(fileIndex[0])
      );
  });
});
