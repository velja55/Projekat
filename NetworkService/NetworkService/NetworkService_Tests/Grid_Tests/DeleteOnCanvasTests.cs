﻿using NetworkService.Model;
using NetworkService.ViewModel;
using NUnit.Framework;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading;

namespace GridTests
{
    [TestFixture]
    public class DeleteOnCanvasTests
    {
        private GridViewModel _viewModel;
        private PressureInVentil _testEntity1;
        private PressureInVentil _testEntity2;

        [SetUp]
        public void Setup()
        {
            var staThread = new Thread(() =>
            {

                _viewModel = new GridViewModel();
                _testEntity1 = new PressureInVentil(0, "Digital manometar", "image1.png");
                _testEntity2 = new PressureInVentil(1, "Cable sensor", "image2.png");
                _viewModel.EntitiesByTypes = new ObservableCollection<EntitiesByType>
            {
                new EntitiesByType("Digital manometar") {Pressures = new ObservableCollection<PressureInVentil> { _testEntity1 } },
                new EntitiesByType("Cable sensor"){Pressures = new ObservableCollection<PressureInVentil> { _testEntity2 } }
            };

                _viewModel.objectsOnCanvas = new List<PressureInVentil>()
            {
                _testEntity1,
                _testEntity2
            };

                _viewModel.SelectedId = new ObservableCollection<string> { "1", "2" };
                _viewModel.SelectedValue = new ObservableCollection<string> { "10", "15" };
                _viewModel.GridBackgrounds = new ObservableCollection<string> { "White", "White" };
                _viewModel.originalIndexs = new List<int> { 0, 1 };
                _viewModel.LinesOnDisplay = new ObservableCollection<DisplayLine>
            {
                new DisplayLine(10, 20, 30, 40),
                new DisplayLine(50, 60, 70, 80)
            };

            });
            staThread.SetApartmentState(ApartmentState.STA);
            staThread.Start();
            staThread.Join();
        }

        [Test]
        public void DeleteonCanvasAndView_UklanjanjeLinijaSaEntitetom()
        {
            int entityIdToRemove = 1;
            double x = 100;
            double y = 100;
            _viewModel.LinesOnDisplay.Add(new DisplayLine(x, 200, y, 200)); 
            _viewModel.DeleteonCanvasAndView(entityIdToRemove);

            // Assert
            Assert.IsTrue(_viewModel.LinesOnDisplay.Any(l => l.X1 == x && l.Y1 == y || l.X2 == x && l.Y2 == y), "Associated lines should be removed.");
        }



        [Test]
        public void DeleteonCanvasAndView_EntitetNePostoji()
        {
            int entityIdToRemove = 999;
            _viewModel.DeleteonCanvasAndView(entityIdToRemove);
            Assert.AreEqual(2, _viewModel.objectsOnCanvas.Count);
            Assert.AreEqual(1, _viewModel.EntitiesByTypes[0].Pressures.Count);
            Assert.AreEqual(1, _viewModel.EntitiesByTypes[1].Pressures.Count);
        }

    }


}
