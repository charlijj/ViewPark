
const ctx = document.getElementById('forecast-graph');

new Chart(ctx, {
type: 'bar',
data: {
    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    datasets: [{
    label: '# of Votes',
    data: [12, 19, 3, 5, 2, 3],
    borderWidth: 1
    }]
},
options: {
    scales: {
    y: {
        beginAtZero: true
    }
    }
}
});


// const ctx = document.getElementById('forecast-graph');

// const graph_label = "<?php echo $forecast_day ?>";

// // Time labels for the x axis of the chart
// const l1 = '6';
// const l2 = '7';
// const l3 = '8';
// const l4 = '9';
// const l5 = '10';
// const l6 = '11';
// const l7 = '12';
// const l8 = '1';
// const l9 = '2';
// const l10 = '3';
// const l11 = '4';
// const l12 = '5';
 
// // Data for the chart.
// // d1 corresponds to l1, d2 to l2, and so on.
// const d1 = "<?php echo $chart_data['06'] ?>";
// const d2 = "<?php echo $chart_data['07'] ?>";
// const d3 = "<?php echo $chart_data['08'] ?>";
// const d4 = "<?php echo $chart_data['09'] ?>";
// const d5 = "<?php echo $chart_data['10'] ?>";
// const d6 = "<?php echo $chart_data['11'] ?>";
// const d7 = "<?php echo $chart_data['12'] ?>";
// const d8 = "<?php echo $chart_data['13'] ?>";
// const d9 = "<?php echo $chart_data['14'] ?>";
// const d10 = "<?php echo $chart_data['15'] ?>";
// const d11 = "<?php echo $chart_data['16'] ?>";
// const d12 = "<?php echo $chart_data['17'] ?>";

// new Chart(ctx, {
//     type: 'bar',
//     data: {
//         labels: [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12],
//         datasets: [{
//             label: graph_label,
//             data: [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12],
//             borderWidth: 1,
//             // Colors bars based on value of data. Remove for blue
//             backgroundColor: function(context) {
//                 var value = context.dataset.data[context.dataIndex];
//                 if (value > 80) {
//                     return 'rgba(255, 99, 132, 0.2)';
//                 } else if (value > 60) {
//                     return 'rgba(255, 221, 99, 0.2)';
//                 } else {
//                     return 'rgba(120, 190, 120, 0.2)';
//                 }
//             },
//             borderColor: function(context) {
//                 var value = context.dataset.data[context.dataIndex];
//                 if (value > 80) {
//                     return 'rgb(255, 99, 132)';
//                 } else if (value > 60) {
//                     return 'rgb(255, 221, 99)';
//                 } else {
//                     return 'rgb(120, 190, 120)';
//                 }
//             }
//         }]
//     },
//     options: {
//         scales: {
//             y: {
//             beginAtZero: true,
//             max: 100
//             }
//         }
//     }
// });