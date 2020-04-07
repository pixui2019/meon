/**
 * Created by Joeyoung on 2017/9/9.
 */


//------------------------------ ��ҳ���� ------------------------------

// ��ǰѡ��ҳ
var ty_currentPage;

// totalPage:����˷��ص���ҳ��
// callback:�ص�����
function ty_dealPaging(totalPage, callback) {

  // ����UI
  $('#ty_paging').empty();
  $('#ty_paging').append(
    '<li class="home">��ҳ</li>' +
    '<li class="prev">��</li>' +
    '<li class="next">��</li>' +
    '<li class="max">��0ҳ</li>' +
    '<input type="number" min="1" value="1" class="inputPage">' +
    '<li class="jump">��ת</li>'
  );

  var
    $paging = $('#ty_paging'),                              // ��ҳul
    $homePage = $('#ty_paging .home'),                      // ��ҳ
    $prevPage = $('#ty_paging .prev'),                      // ��һҳ
    $nextPage = $('#ty_paging .next'),                      // ��һҳ
    $inputPage = $('#ty_paging .inputPage'),                // ����ҳ��
    $jumpPage = $('#ty_paging .jump'),                      // ��ת
    maxPage = totalPage,                                    // ��ҳ��
    onePageMaxCount = 5;                                    // һҳ���չʾ�ķ�ҳ����(���޸�)

  // ��ҳ����
  if (maxPage > 1) {
    // ��ʾ��ҳ
    $paging.show();
    // ��ʾ��ҳ��
    $('#ty_paging .max').text('��' + maxPage + 'ҳ');
    // �Ƴ���ҳ��ǩ 1 2 3 ...
    $('#ty_paging .pageIndex').remove();

    if (!ty_currentPage) {
      ty_currentPage = 1;
    }
    // �޸��������תҳ������ǰҳ��+1��
    var jumpNum = ty_currentPage;
    $inputPage.val(Math.min(maxPage, ++jumpNum)).attr("max", maxPage);


    // ��Ҫչʾ�ķ�ҳ��Χ
    var startIndex = 1,
      endIndex = maxPage;

    if (maxPage <= onePageMaxCount) {// һҳ����ʾ�·�ҳ����
      startIndex = 1;
      endIndex = maxPage;
    } else {
      if (ty_currentPage <= Math.ceil(onePageMaxCount / 2)) {
        startIndex = 1;
        endIndex = onePageMaxCount;
      } else {
        startIndex = ty_currentPage - (Math.ceil(onePageMaxCount / 2) - 1);
        endIndex = ty_currentPage + (Math.ceil(onePageMaxCount / 2) - 1);
        if (endIndex > maxPage) {
          endIndex = maxPage;
          startIndex = maxPage - (onePageMaxCount - 1);
        }
      }
    }
    // ��ӷ�ҳ��ǩ 1 2 3 ...
    for (var p = startIndex; p <= endIndex; p++) {
      $nextPage.before('<li  class="pageIndex" value=' + p + '>' + p + '</li>');
    }

    // �޸���ʽ
    $('#ty_paging .pageIndex').each(function (index, liDom) {
      // ѡ�з�ҳ�޸�css
      if (ty_currentPage == $(liDom).val()) {
        $(liDom).css({'backgroundColor':'#31C27C',
          'color':'white',
          'border-color':'#31C27C'});
      } else {
        $(liDom).css({'backgroundColor':'white',
          'color':'#666666',
          'border-color':"#ddd"});
      }
    });

    // ������ʽ
    $('#ty_paging li.pageIndex').mouseover(function () {
      if ($(this).val() == ty_currentPage) return;
      $(this).css({
        'border-color':'#31C27C',
        'color':'#31C27C'
      });
    });
    $('#ty_paging li.pageIndex').mouseout(function () {
      if ($(this).val() == ty_currentPage) return;
      $(this).css({
        'border-color':"#ddd",
        'color':'#666'
      });
    });

    // ���¼�
    $('#ty_paging .pageIndex').click(function () {
      ty_currentPage = $(this).val();
      if (callback) {
        callback(ty_currentPage);
      }
    });

  } else {
    // ���ط�ҳ
    $paging.hide();
  }

  // ȡ����event
  $homePage.unbind().click();
  $prevPage.unbind().click();
  $nextPage.unbind().click();
  $jumpPage.unbind().click();

  // ��ҳ ,��һҳ ��event
  if (ty_currentPage !== 1) {

    $homePage.click(function () {// ��ҳ
      ty_currentPage = 1;
      if (callback) {
        callback(ty_currentPage);
      }
    });
    $prevPage.click(function () {// ��һҳ
      ty_currentPage = Math.max(1, --ty_currentPage);
      if (callback) {
        callback(ty_currentPage);
      }
    });

    $homePage.css("color", "#666");
    $prevPage.css("color", "#666");

  } else {
    $homePage.css("color", "#ddd");
    $prevPage.css("color", "#ddd");
  }

  // ��һҳ ��event
  if (ty_currentPage !== maxPage) {
    $nextPage.click(function () {
      ty_currentPage = Math.min(maxPage, ++ty_currentPage);
      if (callback) {
        callback(ty_currentPage);
      }
    });

    $jumpPage.css('color','#666');
    $nextPage.css("color", "#666");
  } else {
    $jumpPage.css('color','#ddd');
    $nextPage.css("color", "#ddd");
  }

  // ��ת ��event
  $jumpPage.click(function () {
    if (checkPositiveInteger($inputPage.val())) {// ������
      ty_currentPage = Math.min(maxPage, $inputPage.val());
      if (callback) {
        callback(ty_currentPage);
      }
    } else {
      $inputPage.focus();
    }

  });

  // У���Ƿ�����������
  var checkPositiveInteger = function (integer) {
    if (!integer.match(/^[0-9]*[1-9][0-9]*$/)) {
      return false;
    } else {
      return true;
    }
  };
}