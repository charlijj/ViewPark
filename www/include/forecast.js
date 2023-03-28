const ctx = document.getElementById('forecast-graph');

const graph_label = "<?php echo forecast_day ?>";

const l1 = '6';
const l2 = '7';
const l3 = '8';
const l4 = '9';
const l5 = '10';
const l6 = '11';
const l7 = '12';
const l8 = '1';
const l9 = '2';
const l10 = '3';
const l11 = '4';
const l12 = '5';

const d1 = "<?php echo $d1 ?>";
const d2 = "<?php echo $d2 ?>";
const d3 = "<?php echo $d3 ?>";
const d4 = "<?php echo $d4 ?>";
const d5 = "<?php echo $d5 ?>";
const d6 = "<?php echo $d6 ?>";
const d7 = "<?php echo $d7 ?>";
const d8 = "<?php echo $d8 ?>";
const d9 = "<?php echo $d9 ?>";
const d10 = "<?php echo $d10 ?>";
const d11 = "<?php echo $d11 ?>";
const d12 = "<?php echo $d12 ?>";

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12],
        datasets: [{
            label: graph_label,
            data: [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
            beginAtZero: true,
            max: 100
            }
        }
    }
});