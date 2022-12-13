/*jshint browser:true, undef: true, unused: true, jquery: true */

var $container;
var filters = {};

$(function(){
  $container = $('#expcontainer');
 // createContent();
  var $filterDisplay = $('#filter-display');
  
  $container.isotope();
  $container.on( 'arrangeComplete', function( event, filteredItems ) {
    console.log( filteredItems.length );
    AOS.refresh();
  });
  // do stuff when checkbox change
  $('#options').on( 'change', function( jQEvent ) {

    $( "#more_but" ).hide();
    $('#expcontainer .hidden').removeClass("hidden");

    var $checkbox = $( jQEvent.target );
    manageCheckbox( $checkbox );

    var comboFilter = getComboFilter( filters );

    $container.isotope({ filter: comboFilter });

    matchEl = document.getElementsByClassName("match");
    if(matchEl.length>=1) {
      new ResponsiveAutoHeight('.match');
    }
    matchEl = document.getElementsByClassName("match2");
    if(matchEl.length>=1) {
      new ResponsiveAutoHeight('.match2');
    }
  
    $filterDisplay.text( comboFilter );
  });

});


var data = {
  brands: 'brand1 brand2 brand3 brand4'.split(' '),
  productTypes: 'type-whale-tours type-scenic-flights type-adventure type-food-wine-gin'.split(' '),
  colors: 'red blue yellow green'.split(' '),
  sizes: 'uk-size8 uk-size9 uk-size10 uk-size11'.split(' ')
};

function createContent() {
  var brand, productType, color, size;
  var items = '';
  // dynamically create content
  for (var i=0, len1 = data.brands.length; i < len1; i++) {
    brand = data.brands[i];
    for (var j=0, len2 = data.productTypes.length; j < len2; j++) {
      productType = data.productTypes[j];
        for (var l=0, len3 = data.colors.length; l < len3; l++) {
        color = data.colors[l];
        for (var k=0, len4 = data.sizes.length; k < len4; k++) {
          size = data.sizes[k];
          var itemHtml = '<div class="item ' + brand + ' ' +
            productType + ' ' + color + ' ' + size + '">' +
            '<p>' + brand + '</p>' +
            '<p>' + productType + '</p>' +
            '<p>' + size + '</p>' +
            '</div>';
            items += itemHtml;
        }
      }
    }
  }

  $container.append( items );
}


function getComboFilter( filters ) {
  var i = 0;
  var comboFilters = [];
  var message = [];

  for ( var prop in filters ) {
    message.push( filters[ prop ].join(' ') );
    var filterGroup = filters[ prop ];
    // skip to next filter group if it doesn't have any values
    if ( !filterGroup.length ) {
      continue;
    }
    if ( i === 0 ) {
      // copy to new array
      comboFilters = filterGroup.slice(0);
    } else {
      var filterSelectors = [];
      // copy to fresh array
      var groupCombo = comboFilters.slice(0); // [ A, B ]
      // merge filter Groups
      for (var k=0, len3 = filterGroup.length; k < len3; k++) {
        for (var j=0, len2 = groupCombo.length; j < len2; j++) {
          filterSelectors.push( groupCombo[j] + filterGroup[k] ); // [ 1, 2 ]
        }

      }
      // apply filter selectors to combo filters for next group
      comboFilters = filterSelectors;
    }
    i++;
  }

  var comboFilter = comboFilters.join(', ');
  return comboFilter;
}

function manageCheckbox( $checkbox ) {
  var checkbox = $checkbox[0];

  var group = $checkbox.parents('.option-set').attr('data-group');
  // create array for filter group, if not there yet
  var filterGroup = filters[ group ];
  if ( !filterGroup ) {
    filterGroup = filters[ group ] = [];
  }

  var isAll = $checkbox.hasClass('all');

  console.log({isAll});
  // reset filter group if the all box was checked
  if ( isAll ) {
    delete filters[ group ];
    if ( !checkbox.checked ) {
      checkbox.checked = 'checked';
      console.log(checkbox.checked);
    }
  }
  console.log({isAll});
  // index of
  var index = $.inArray( checkbox.value, filterGroup );
  console.log("checkbox.checked: " + checkbox.checked);
  if ( checkbox.checked ) {
    console.log("is !isAll" + isAll);
    var selector = isAll ? 'input.other' : 'input.all';

    console.log("checkbox.checked: " + checkbox.checked);
   // $checkbox.children( selector ).removeAttr('checked');
   console.log({selector});
    $checkbox.parent().parent().find(selector).prop("checked", false);
    
    console.log({selector});

    if ( !isAll && index === -1 ) {
      // add filter to group
      filters[ group ].push( checkbox.value );
    }

  } else if ( !isAll ) {
    // remove filter from group
    filters[ group ].splice( index, 1 );
    // if unchecked the last box, check the all
    console.log("is !isAll" + isAll);
    if ( !$checkbox.find('[checked]').length ) {
      console.log($checkbox.parent().parent().find('input.all'));
      $checkbox.parent().parent().find('input.all').prop("checked", true)
    }
  }

}